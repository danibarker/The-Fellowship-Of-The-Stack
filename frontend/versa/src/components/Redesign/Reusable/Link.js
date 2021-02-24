import { Link } from "react-router-dom";
import styled, { css } from "styled-components";
import GradientMove from "./Animations";

export const StyledLink = styled(Link)`
    display: inline-flex;
    flex-direction: row;
    padding: 15px 40px;
    text-transform: uppercase;
    font-weight: 700;
    color: ${(props) => props.theme.blue};
    letter-spacing: 0.05em;
    border: none;
    animation: ${GradientMove} 6s ease infinite;
    transition: all 0.3s linear;
    background: ${(props) => props.theme.purple};
    border-radius: 15px;
    font-family: "Inter", sans-serif;
    margin: 0;
    max-width: fit-content;
    outline: none;
    cursor: pointer;

    svg {
        path {
            stroke: ${(props) => props.theme.blue};
            fill: ${(props) => props.theme.blue};
        }
    }
    :hover {
        svg {
            path {
                fill: ${(props) => props.theme.black};
                stroke: ${(props) => props.theme.black};
            }
        }
        background: ${(props) => props.theme.holo};
        color: ${(props) => props.theme.black};
    }
    ${(props) =>
        props.primarySmall &&
        css`
            border-radius: 8px;
            padding: 10px 20px;
        `}
    ${(props) =>
        props.secondary &&
        css`
            background: ${(props) => props.theme.black};
            padding: 20px 40px;
        `}
    ${(props) =>
        props.secondarySmall &&
        css`
            background: ${(props) => props.theme.black};
            border-radius: 8px;
            padding: 10px 20px;
            color: ${(props) => props.theme.blue};
            :hover {
                background: ${(props) => props.theme.purple};
                color: ${(props) => props.theme.blue};
                svg {
                    path {
                        stroke: ${(props) => props.theme.blue};
                    }
                }
            }
        `}
    ${(props) =>
        props.tertiary &&
        css`
            color: ${(props) => props.theme.purple};
            padding: 10px 20px;
            background: transparent;
            position: relative;
            border-bottom: 3px solid transparent;
            svg {
                margin-right: 8px;
                path {
                    stroke: ${(props) => props.theme.purple};
                    fill: ${(props) => props.theme.purple};
                }
            }

            :hover {
                color: ${(props) => props.theme.purple};
                svg {
                    margin-right: 8px;
                    path {
                        stroke: ${(props) => props.theme.purple};
                        fill: ${(props) => props.theme.purple};
                    }
                }

                background: none;
            }
            ::after {
                transition: opacity 0.3s ease;
                content: "";
                position: absolute;
                width: 0%;
                transform: translate(-15%, 800%);
                height: 4px;
                border-radius: 50px;
                opacity: 0;
                background: ${(props) => props.theme.holo};
                box-shadow: ${(props) => props.theme.shadow};
            }
            &:hover::after {
                width: 100%;
                opacity: 100%;
            }
        `}
`;